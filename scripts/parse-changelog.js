#!/usr/bin/env node

/**
 * Парсит changelog из markdown для конкретной библиотеки токенов
 * Аналог parseTokenLibChangelog из Android проекта
 * 
 * Использование: node scripts/parse-changelog.js [LIBRARY_NAME] [CHANGELOG_MD_FILE] [OUTPUT_FILE] [CORE_LIB_NAME]
 */

const fs = require('fs');
const path = require('path');

// Параметры
const LIBRARY_NAME = process.argv[2] || '';
const CHANGELOG_MD_FILE = process.argv[3] || '../release-changelog.md';
const OUTPUT_FILE = process.argv[4] || '';
const CORE_LIB_NAME = process.argv[5] || 'sdds-uikit';

if (!LIBRARY_NAME) {
    console.error('❌ Не указано имя библиотеки');
    process.exit(1);
}

// Нормализация имени библиотеки (убираем префикс :tokens:)
const normalizeLibraryName = (name) => {
    return name.replace(/^:tokens:/, '');
};

const NORMALIZED_LIB_NAME = normalizeLibraryName(LIBRARY_NAME);

// Проверяем наличие файла
if (!fs.existsSync(CHANGELOG_MD_FILE)) {
    console.error(`❌ Файл не найден: ${CHANGELOG_MD_FILE}`);
    process.exit(1);
}

// Читаем markdown
const markdown = fs.readFileSync(CHANGELOG_MD_FILE, 'utf-8');

// Парсим markdown
function parseTokenLibChangelog(markdown, tokenLibName, coreLibName) {
    const lines = markdown.split('\n');
    
    let currentSection = null;
    let currentSectionTitle = null;
    let currentComponent = null;
    let currentItems = [];
    const result = {
        core: [], // Массив объектов { sectionTitle, components: [...] }
        lib: []   // Массив объектов { sectionTitle, components: [...] }
    };
    
    let i = 0;
    while (i < lines.length) {
        const line = lines[i].trim();
        
        // H2 заголовок (секция)
        if (line.startsWith('## ') && !line.startsWith('### ')) {
            // Сохраняем предыдущую секцию
            if (currentSection && currentComponent && currentItems.length > 0) {
                addComponent(currentSection, currentSectionTitle, currentComponent, currentItems);
            }
            
            const sectionTitle = line.substring(3).trim();
            if (isCoreSection(sectionTitle, coreLibName)) {
                currentSection = 'core';
                currentSectionTitle = sectionTitle;
            } else if (isLibSection(sectionTitle, tokenLibName)) {
                currentSection = 'lib';
                currentSectionTitle = sectionTitle;
            } else {
                currentSection = null;
                currentSectionTitle = null;
            }
            currentComponent = null;
            currentItems = [];
        }
        // H3 заголовок (компонент)
        else if (line.startsWith('### ')) {
            // Сохраняем предыдущий компонент
            if (currentSection && currentComponent && currentItems.length > 0) {
                addComponent(currentSection, currentSectionTitle, currentComponent, currentItems);
            }
            
            currentComponent = line.substring(4).trim();
            currentItems = [];
        }
        // Элемент списка (поддерживаем как `-`, так и `*`)
        else if ((line.startsWith('- ') || line.startsWith('* ')) && currentSection && currentComponent) {
            const itemText = line.substring(2).trim();
            // Извлекаем ссылку на PR если есть
            const prMatch = itemText.match(/\[PR\]\((https?:\/\/[^\)]+)\)/);
            const text = prMatch ? itemText.replace(/\s*\[PR\]\([^\)]+\)/, '').trim() : itemText;
            const prLink = prMatch ? prMatch[1] : null;
            
            currentItems.push({ text, prLink });
        }
        // Параграф с ссылкой на PR (может быть отдельной строкой после списка)
        else if (line.match(/^\[PR\]\(https?:\/\/[^\)]+\)$/) && currentSection && currentComponent) {
            if (currentItems.length > 0) {
                const lastItem = currentItems[currentItems.length - 1];
                const prMatch = line.match(/\[PR\]\((https?:\/\/[^\)]+)\)/);
                if (prMatch && !lastItem.prLink) {
                    lastItem.prLink = prMatch[1];
                }
            }
        }
        // Пустая строка после элемента списка - пропускаем
        else if (line === '' && currentSection && currentComponent) {
            // Пропускаем пустые строки
        }
        
        i++;
    }
    
    // Сохраняем последний компонент
    if (currentSection && currentComponent && currentItems.length > 0) {
        addComponent(currentSection, currentSectionTitle, currentComponent, currentItems);
    }
    
    function addComponent(section, sectionTitle, component, items) {
        if (!sectionTitle) return;
        
        const sectionList = section === 'core' ? result.core : result.lib;
        // Ищем секцию с таким названием
        let sectionObj = sectionList.find(s => s.sectionTitle === sectionTitle);
        if (!sectionObj) {
            sectionObj = { sectionTitle, components: [] };
            sectionList.push(sectionObj);
        }
        
        // Ищем компонент в секции
        let comp = sectionObj.components.find(c => c.component === component);
        if (!comp) {
            comp = { component, children: [] };
            sectionObj.components.push(comp);
        }
        comp.children.push(...items);
    }
    
    return result;
}

function isCoreSection(heading, coreName) {
    const normalizedHeading = heading.toLowerCase().replace(/\s+/g, '-');
    const normalizedCoreName = coreName.toLowerCase().replace(/\s+/g, '-');
    
    // Проверяем точное совпадение
    if (normalizedHeading === normalizedCoreName) {
        return true;
    }
    
    // Список известных Core секций (компоненты и общие изменения)
    const coreSections = [
        'sddscomponents',
        'sdds-components',
        'sddsthemecore',
        'sdds-theme-core',
        'sdds-uikit',
        'sddsuikit'
    ];
    
    // Проверяем, является ли заголовок одной из Core секций
    return coreSections.some(core => normalizedHeading === core || normalizedHeading.includes(core));
}

function isLibSection(heading, libName) {
    // Маппинг названий из markdown в имена библиотек
    const nameMapping = {
        'plasma-styles-salute': 'styles-salute-theme',
        'plasma-stylesalute': 'styles-salute-theme',
        'styles-salute': 'styles-salute-theme',
        'plasma-b2c': 'plasma-b2c-theme',
        'plasma-b2c-theme': 'plasma-b2c-theme',
        'plasma-homeds': 'plasma-home-ds-theme',
        'plasma-home-ds': 'plasma-home-ds-theme',
        'plasma-home-ds-theme': 'plasma-home-ds-theme',
        'sdds-serv': 'sddsserv-theme',
        'sddsserv': 'sddsserv-theme',
        'sddsserv-theme': 'sddsserv-theme'
    };
    
    // Нормализуем названия
    const normalizedHeading = heading.toLowerCase().replace(/\s+/g, '-');
    const normalizedLibName = libName.toLowerCase().replace(/\s+/g, '-');
    
    // Проверяем маппинг
    const mappedName = nameMapping[normalizedHeading];
    if (mappedName && mappedName === normalizedLibName) {
        return true;
    }
    
    // Проверяем различные варианты названий (убираем префиксы и суффиксы)
    const headingWithoutPrefix = normalizedHeading.replace(/^(plasma-|sdds-)/, '').replace(/-theme$/, '');
    const libNameWithoutSuffix = normalizedLibName.replace(/-theme$/, '');
    
    return normalizedHeading === normalizedLibName || 
           normalizedHeading.includes(normalizedLibName) ||
           normalizedLibName.includes(normalizedHeading) ||
           headingWithoutPrefix === libNameWithoutSuffix ||
           headingWithoutPrefix.includes(libNameWithoutSuffix) ||
           libNameWithoutSuffix.includes(headingWithoutPrefix);
}

// Парсим changelog
const parsed = parseTokenLibChangelog(markdown, NORMALIZED_LIB_NAME, CORE_LIB_NAME);

// Генерируем markdown для библиотеки
function generateMarkdown(parsed) {
    const sections = [];
    
    // Core секции (используем оригинальные названия)
    for (const sectionObj of parsed.core) {
        sections.push(`## ${sectionObj.sectionTitle}`);
        sections.push('');
        for (const comp of sectionObj.components) {
            sections.push(`### ${comp.component}`);
            for (const item of comp.children) {
                let line = `- ${item.text}`;
                if (item.prLink) {
                    line += ` [PR](${item.prLink})`;
                }
                sections.push(line);
            }
            sections.push('');
        }
    }
    
    // Lib секции (используем оригинальные названия)
    for (const sectionObj of parsed.lib) {
        sections.push(`## ${sectionObj.sectionTitle}`);
        sections.push('');
        for (const comp of sectionObj.components) {
            sections.push(`### ${comp.component}`);
            for (const item of comp.children) {
                let line = `- ${item.text}`;
                if (item.prLink) {
                    line += ` [PR](${item.prLink})`;
                }
                sections.push(line);
            }
            sections.push('');
        }
    }
    
    if (sections.length === 0) {
        return `# Changelog for ${LIBRARY_NAME}\n\nNo changes found for ${LIBRARY_NAME} in this release.\n`;
    }
    
    return `# Changelog for ${LIBRARY_NAME}\n\n${sections.join('\n')}\n`;
}

const output = generateMarkdown(parsed);

// Выводим результат
console.log('✅ Changelog для', LIBRARY_NAME, 'извлечен:');
console.log('');
console.log(output);

// Сохраняем в файл если указан
if (OUTPUT_FILE) {
    const outputDir = path.dirname(OUTPUT_FILE);
    if (outputDir && !fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir, { recursive: true });
    }
    fs.writeFileSync(OUTPUT_FILE, output, 'utf-8');
    console.log('');
    console.log('💾 Результат сохранен в:', OUTPUT_FILE);
}

