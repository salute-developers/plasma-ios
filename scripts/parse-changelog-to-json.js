#!/usr/bin/env node

/**
 * Парсит changelog из markdown и преобразует в JSON формат для истории версий
 * Аналог toDto() из Android проекта
 * 
 * Использование: node scripts/parse-changelog-to-json.js [LIBRARY_NAME] [CHANGELOG_MD_FILE] [CORE_LIB_NAME]
 */

const fs = require('fs');

// Параметры
const LIBRARY_NAME = process.argv[2] || '';
const CHANGELOG_MD_FILE = process.argv[3] || '../release-changelog.md';
const CORE_LIB_NAME = process.argv[4] || 'sdds-uikit';

if (!LIBRARY_NAME) {
    console.error('❌ Не указано имя библиотеки');
    process.exit(1);
}

// Нормализация имени библиотеки
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

// Парсим markdown (используем ту же логику, что и в parse-changelog.js)
function parseTokenLibChangelog(markdown, tokenLibName, coreLibName) {
    const lines = markdown.split('\n');
    
    let currentSection = null;
    let currentComponent = null;
    let currentItems = [];
    const result = {
        core: [],
        lib: []
    };
    
    let i = 0;
    while (i < lines.length) {
        const line = lines[i].trim();
        
        // H2 заголовок (секция)
        if (line.startsWith('## ') && !line.startsWith('### ')) {
            // Сохраняем предыдущую секцию
            if (currentSection && currentComponent && currentItems.length > 0) {
                addComponent(currentSection, currentComponent, currentItems);
            }
            
            const sectionTitle = line.substring(3).trim();
            if (isCoreSection(sectionTitle, coreLibName)) {
                currentSection = 'core';
            } else if (isLibSection(sectionTitle, tokenLibName)) {
                currentSection = 'lib';
            } else {
                currentSection = null;
            }
            currentComponent = null;
            currentItems = [];
        }
        // H3 заголовок (компонент)
        else if (line.startsWith('### ')) {
            // Сохраняем предыдущий компонент
            if (currentSection && currentComponent && currentItems.length > 0) {
                addComponent(currentSection, currentComponent, currentItems);
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
            const prId = prLink ? extractPrId(prLink) : null;
            
            currentItems.push({ 
                text, 
                link: prLink,
                id: prId
            });
        }
        // Параграф с ссылкой на PR (может быть отдельной строкой после списка)
        else if (line.match(/^\[PR\]\(https?:\/\/[^\)]+\)$/) && currentSection && currentComponent) {
            if (currentItems.length > 0) {
                const lastItem = currentItems[currentItems.length - 1];
                const prMatch = line.match(/\[PR\]\((https?:\/\/[^\)]+)\)/);
                if (prMatch && !lastItem.link) {
                    lastItem.link = prMatch[1];
                    lastItem.id = extractPrId(prMatch[1]);
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
        addComponent(currentSection, currentComponent, currentItems);
    }
    
    function addComponent(section, component, items) {
        const sectionList = section === 'core' ? result.core : result.lib;
        let comp = sectionList.find(c => c.component === component);
        if (!comp) {
            comp = { component, children: [] };
            sectionList.push(comp);
        }
        comp.children.push(...items);
    }
    
    return result;
}

function extractPrId(link) {
    const match = link.match(/\/(\d+)$/);
    return match ? parseInt(match[1], 10) : null;
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

// Преобразуем в DTO формат (как на Android)
const dto = {
    date: new Date().toISOString().split('T')[0], // YYYY-MM-DD
    core: parsed.core.length > 0 ? parsed.core : null,
    lib: parsed.lib.length > 0 ? parsed.lib : null
};

// Выводим JSON
console.log(JSON.stringify(dto, null, 2));

