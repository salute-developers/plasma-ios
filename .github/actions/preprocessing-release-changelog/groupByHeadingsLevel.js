import { groupByH2Headings } from './groupByH2Headings.js';
import { buildChangelogJson } from './buildChangelogJson.js';

export function groupByHeadingsLevel(tree, file) {
    // Группировка по заголовкам h2
    const h2Groups = groupByH2Headings(tree.children);

    // Создаем структуру для объединения компонентов по H3 заголовкам
    const componentsByH2 = new Map();

    // Обрабатываем каждую H2 группу
    for (const [h2Title, h2Content] of h2Groups.entries()) {
        if (!componentsByH2.has(h2Title)) {
            componentsByH2.set(h2Title, new Map());
        }

        const componentsMap = componentsByH2.get(h2Title);

        // Разбиваем содержимое на секции по H3 заголовкам и PR-ссылкам
        let sections = [];
        let currentSection = [];
        let currentH3 = null;
        let hasH3Headings = false;

        for (let i = 0; i < h2Content.length; i++) {
            const item = h2Content[i];

            if (item.type === 'heading' && item.depth === 3) {
                hasH3Headings = true;
                // Если начинается новый H3 заголовок, сохраняем предыдущую секцию
                if (currentSection.length > 0) {
                    sections.push(currentSection);
                }

                // Начинаем новую секцию с H3 заголовком
                currentH3 = item.children[0].value;
                currentSection = [item];
            } else if (currentH3) {
                // Добавляем элемент к текущей секции (если есть H3)
                currentSection.push(item);
            } else {
                // Если нет H3 заголовка, добавляем элементы к секции без H3
                currentSection.push(item);
            }
        }

        // Добавляем последнюю секцию, если она не пуста
        if (currentSection.length > 0) {
            sections.push(currentSection);
        }
        
        // Если нет H3 заголовков, сохраняем всю секцию как есть
        if (!hasH3Headings && sections.length > 0) {
            componentsMap.set('_no_h3', sections);
        }

        // Группируем секции по H3 заголовкам
        for (const section of sections) {
            // Находим H3 заголовок в секции
            let h3Title = null;

            for (const item of section) {
                if (item.type === 'heading' && item.depth === 3) {
                    h3Title = item.children[0].value;
                    break;
                }
            }

            if (h3Title) {
                if (!componentsMap.has(h3Title)) {
                    componentsMap.set(h3Title, []);
                }

                const data = section.find(({ type }) => type === 'heading');

                const link = section.find(({ type, children }) => {
                    return type === 'paragraph' && children.length === 1 && children[0].type === 'link';
                });

                if (!link) {
                    componentsMap.get(h3Title).push([...section, data.link]);
                } else {
                    componentsMap.get(h3Title).push(section);
                }
            }
        }
    }

    // Формирование итогового дерева
    const finalChildren = [];

    // Добавляем H2 заголовок и все его компоненты
    for (const [h2Title, componentsMap] of componentsByH2.entries()) {
        finalChildren.push({
            type: 'heading',
            depth: 2,
            children: [{ type: 'text', value: h2Title }],
        });

        // Добавляем все компоненты для этого H2
        for (const [h3Title, sections] of componentsMap.entries()) {
            // Если это секция без H3 заголовков, добавляем содержимое напрямую
            if (h3Title === '_no_h3') {
                for (const section of sections) {
                    for (const item of section) {
                        finalChildren.push(item);
                    }
                }
            } else {
            // Добавляем H3 заголовок только один раз
            for (const item of sections[0]) {
                if (item.type === 'heading' && item.depth === 3) {
                    finalChildren.push(item);
                    break;
                }
            }

            // Добавляем содержимое всех секций с этим H3 заголовком
            for (const section of sections) {
                for (const item of section) {
                    // Пропускаем H3 заголовки, кроме первого
                    if (item.type === 'heading' && item.depth === 3) {
                        continue;
                    }

                    finalChildren.push(item);
                    }
                }
            }
        }
    }

    // Сохраняем componentsByH2 для генерации JSON (пишем в file.data, чтобы unified не потерял при stringify)
    if (!file.data) {
        file.data = {};
    }
    file.data.componentsByH2 = componentsByH2;

    return {
        ...tree,
        children: finalChildren,
    };
}