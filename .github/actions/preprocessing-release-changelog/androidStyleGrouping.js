export function androidStyleGrouping(tree) {
    // Группируем PR'ы по темам/библиотекам и компонентам
    const themes = new Map();
    
    // Проходим по всем элементам дерева
    for (const child of tree.children) {
        if (child.type === 'list') {
            // Обрабатываем список PR'ов
            for (const listItem of child.children) {
                if (listItem.children && listItem.children.length > 0) {
                    const paragraph = listItem.children[0];
                    if (paragraph.type === 'paragraph' && paragraph.children) {
                        // Извлекаем текст PR'а
                        let prText = '';
                        let prLink = '';
                        
                        for (const textChild of paragraph.children) {
                            if (textChild.type === 'text') {
                                prText += textChild.value;
                            } else if (textChild.type === 'link') {
                                prLink = textChild.url;
                                if (textChild.children && textChild.children[0]) {
                                    prText += textChild.children[0].value;
                                }
                            }
                        }
                        
                        // Определяем тему/библиотеку на основе названия PR'а
                        let theme = 'SDDSComponents'; // по умолчанию
                        let component = 'Other';
                        
                        if (prText.includes('ButtonGroup') || prText.includes('IconButtonGroup')) {
                            component = 'ButtonGroup';
                        } else if (prText.includes('TextField') || prText.includes('TextInput')) {
                            component = 'TextField';
                        } else if (prText.includes('Button') && !prText.includes('ButtonGroup')) {
                            component = 'Button';
                        } else if (prText.includes('Card')) {
                            component = 'Card';
                        } else if (prText.includes('TabBar') || prText.includes('Tab')) {
                            component = 'TabBar';
                        } else if (prText.includes('CodeInput') || prText.includes('Code')) {
                            component = 'CodeInput';
                        } else if (prText.includes('Skeleton')) {
                            component = 'Skeleton';
                        } else if (prText.includes('Notification')) {
                            component = 'NotificationContent';
                        } else if (prText.includes('Drawer')) {
                            component = 'Drawer';
                        } else if (prText.includes('Icons') || prText.includes('Icon')) {
                            component = 'Icons';
                            theme = 'SDDSIcons';
                        } else if (prText.includes('Theme') || prText.includes('Tokens')) {
                            component = 'Theme';
                            theme = 'SDDSTheme';
                        } else if (prText.includes('Core') || prText.includes('Build') || prText.includes('Chore')) {
                            component = 'Core';
                            theme = 'Core';
                        }
                        
                        // Определяем тему на основе содержимого PR'а
                        if (prText.includes('SDDSIcons') || prText.includes('Icons')) {
                            theme = 'SDDSIcons';
                        } else if (prText.includes('SDDSTheme') || prText.includes('Theme') || prText.includes('Tokens')) {
                            theme = 'SDDSTheme';
                        } else if (prText.includes('PlasmaB2C') || prText.includes('PlasmaHomeDS') || prText.includes('SDDSserv') || prText.includes('StylesSalute')) {
                            theme = 'Themes';
                        } else if (prText.includes('Core') || prText.includes('Build') || prText.includes('Chore')) {
                            theme = 'Core';
                        }
                        
                        // Добавляем в группировку
                        if (!themes.has(theme)) {
                            themes.set(theme, new Map());
                        }
                        
                        const themeMap = themes.get(theme);
                        if (!themeMap.has(component)) {
                            themeMap.set(component, []);
                        }
                        
                        themeMap.get(component).push({
                            text: prText,
                            link: prLink
                        });
                    }
                }
            }
        }
    }
    
    // Формируем итоговое дерево
    const finalChildren = [];
    
    // Сортируем темы
    const sortedThemes = Array.from(themes.keys()).sort();
    
    for (const theme of sortedThemes) {
        // Добавляем H2 заголовок темы
        finalChildren.push({
            type: 'heading',
            depth: 2,
            children: [{ type: 'text', value: theme }]
        });
        
        const themeMap = themes.get(theme);
        
        // Сортируем компоненты
        const sortedComponents = Array.from(themeMap.keys()).sort();
        
        for (const component of sortedComponents) {
            // Добавляем H3 заголовок компонента
            finalChildren.push({
                type: 'heading',
                depth: 3,
                children: [{ type: 'text', value: component }]
            });
            
            const prs = themeMap.get(component);
            
            // Добавляем список PR'ов для этого компонента
            const listItems = prs.map(pr => ({
                type: 'listItem',
                children: [{
                    type: 'paragraph',
                    children: [
                        { type: 'text', value: pr.text },
                        ...(pr.link ? [{
                            type: 'link',
                            url: pr.link,
                            children: [{ type: 'text', value: ` [PR]` }]
                        }] : [])
                    ]
                }]
            }));
            
            finalChildren.push({
                type: 'list',
                children: listItems
            });
        }
    }
    
    return {
        ...tree,
        children: finalChildren
    };
}
