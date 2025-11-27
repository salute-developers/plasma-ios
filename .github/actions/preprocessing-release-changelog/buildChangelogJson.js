// Функция для извлечения текста из AST узла
function extractText(node) {
    if (node.type === 'text') {
        return node.value;
    }
    if (node.children) {
        return node.children.map(extractText).join('');
    }
    return '';
}

// Функция для извлечения PR ссылок из секции
function extractPRs(section) {
    const prs = [];
    for (const item of section) {
        if (item.type === 'paragraph' && item.children) {
            for (const child of item.children) {
                if (child.type === 'link') {
                    prs.push(child.url);
                }
            }
        }
    }
    return prs;
}

// Функция для извлечения элементов списка из секции
function extractItems(section) {
    const items = [];
    for (const item of section) {
        if (item.type === 'list') {
            for (const listItem of item.children) {
                if (listItem.children) {
                    for (const child of listItem.children) {
                        if (child.type === 'paragraph') {
                            const text = extractText(child);
                            if (text.trim()) {
                                items.push(text.trim());
                            }
                        }
                    }
                }
            }
        } else if (item.type === 'paragraph' && item.children) {
            // Проверяем, не является ли это PR ссылкой
            const isPR = item.children.some(child => child.type === 'link');
            if (!isPR) {
                const text = extractText(item);
                if (text.trim() && !text.trim().startsWith('[')) {
                    items.push(text.trim());
                }
            }
        }
    }
    return items;
}

// Функция для определения типа секции (common или theme)
function getSectionType(h2Title) {
    const commonSections = ['SDDSComponents', 'SDDSThemeCore'];
    return commonSections.includes(h2Title) ? 'common' : 'theme';
}

// Функция для определения темы по H2 заголовку
function getThemeFromH2(h2Title) {
    const themeMap = {
        'sddsserv': 'sddsserv-theme',
        'sdds-serv': 'sddsserv-theme',
        'plasma-home-ds': 'plasma-homeds-theme',
        'plasma-homeds': 'plasma-homeds-theme',
        'plasma-b2c': 'plasma-b2c-theme',
        'styles-salute': 'styles-salute-theme',
        'plasma-styles-salute': 'styles-salute-theme'
    };
    
    // Нормализуем (убираем дефисы) для сравнения
    const normalized = h2Title.toLowerCase().replace(/-/g, '');
    for (const [key, theme] of Object.entries(themeMap)) {
        if (normalized === key.toLowerCase().replace(/-/g, '')) {
            return theme;
        }
    }
    return null;
}

// Функция для построения JSON структуры из componentsByH2
export function buildChangelogJson(componentsByH2) {
    const sections = [];
    const themesMap = {
        'sddsserv-theme': new Set(),
        'plasma-homeds-theme': new Set(),
        'plasma-b2c-theme': new Set(),
        'styles-salute-theme': new Set()
    };
    
    const commonSections = ['SDDSComponents', 'SDDSThemeCore'];
    
    // Обрабатываем каждую H2 секцию
    for (const [h2Title, componentsMap] of componentsByH2.entries()) {
        const sectionType = getSectionType(h2Title);
        const theme = getThemeFromH2(h2Title);
        
        const content = [];
        
        // Обрабатываем секции без H3
        if (componentsMap.has('_no_h3')) {
            const noH3Sections = componentsMap.get('_no_h3');
            for (const section of noH3Sections) {
                const items = extractItems(section);
                const prs = extractPRs(section);
                
                if (items.length > 0 || prs.length > 0) {
                    content.push({
                        h3: null,
                        items: items,
                        prs: prs
                    });
                }
            }
        }
        
        // Обрабатываем секции с H3
        for (const [h3Title, h3Sections] of componentsMap.entries()) {
            if (h3Title === '_no_h3') continue;
            
            const items = [];
            const prs = [];
            
            for (const section of h3Sections) {
                const sectionItems = extractItems(section);
                const sectionPRs = extractPRs(section);
                items.push(...sectionItems);
                prs.push(...sectionPRs);
            }
            
            if (items.length > 0 || prs.length > 0) {
                content.push({
                    h3: h3Title,
                    items: items,
                    prs: [...new Set(prs)] // Убираем дубликаты
                });
            }
        }
        
        if (content.length > 0) {
            const sectionData = {
                h2: h2Title,
                type: sectionType,
                content: content
            };
            
            if (sectionType === 'common') {
                sectionData.themes = Object.keys(themesMap);
            } else if (theme) {
                sectionData.theme = theme;
            }
            
            sections.push(sectionData);
            
            // Обновляем маппинг тем
            if (sectionType === 'common') {
                for (const themeName of Object.keys(themesMap)) {
                    themesMap[themeName].add(h2Title);
                }
            } else if (theme) {
                // Добавляем общие секции в тему
                for (const commonSection of commonSections) {
                    if (componentsByH2.has(commonSection)) {
                        themesMap[theme].add(commonSection);
                    }
                }
                themesMap[theme].add(h2Title);
            }
        }
    }
    
    // Формируем итоговый объект themes
    const themes = {};
    for (const [themeName, sectionSet] of Object.entries(themesMap)) {
        themes[themeName] = {
            sections: Array.from(sectionSet).sort((a, b) => {
                // Сначала общие секции, потом тематические
                const aIsCommon = commonSections.includes(a);
                const bIsCommon = commonSections.includes(b);
                if (aIsCommon && !bIsCommon) return -1;
                if (!aIsCommon && bIsCommon) return 1;
                return a.localeCompare(b);
            })
        };
    }
    
    return {
        sections: sections,
        themes: themes
    };
}

