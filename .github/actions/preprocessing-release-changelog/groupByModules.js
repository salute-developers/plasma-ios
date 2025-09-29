import { groupByH2Headings } from './groupByH2Headings.js';

// Маппинг модулей для iOS проекта
const MODULE_MAPPING = {
  'SDDSComponents': 'SDDSComponents',
  'SDDSIcons': 'SDDSIcons', 
  'SDDSTheme': 'SDDSTheme',
  'SDDSThemeCore': 'SDDSThemeCore',
  'SDDSThemeBuilder': 'SDDSThemeBuilder',
  'SDDSDemoApp': 'SDDSDemoApp',
  'Core': 'Core',
  'SDDS': 'SDDS',
  'PlasmaB2C': 'PlasmaB2C',
  'PlasmaHomeDS': 'PlasmaHomeDS',
  'SDDSserv': 'SDDSserv',
  'StylesSalute': 'StylesSalute'
};

// Функция для определения модуля по PR title или content
function detectModule(prTitle, prContent) {
  const text = `${prTitle} ${prContent}`.toLowerCase();
  
  // Проверяем по ключевым словам
  for (const [module, displayName] of Object.entries(MODULE_MAPPING)) {
    if (text.includes(module.toLowerCase()) || 
        text.includes(displayName.toLowerCase())) {
      return displayName;
    }
  }
  
  // Проверяем по паттернам
  if (text.includes('component') || text.includes('ui') || text.includes('button') || text.includes('textfield')) {
    return 'SDDSComponents';
  }
  
  if (text.includes('icon') || text.includes('asset')) {
    return 'SDDSIcons';
  }
  
  if (text.includes('theme') || text.includes('style') || text.includes('color')) {
    return 'SDDSTheme';
  }
  
  if (text.includes('core') || text.includes('base')) {
    return 'Core';
  }
  
  // По умолчанию - общие изменения
  return 'General';
}

export function groupByModules(tree) {
  // Группировка по заголовкам h2 (типы изменений)
  const h2Groups = groupByH2Headings(tree.children);
  
  // Создаем структуру для группировки по модулям
  const modulesMap = new Map();
  
  // Обрабатываем каждую H2 группу (тип изменения)
  for (const [h2Title, h2Content] of h2Groups.entries()) {
    // Разбиваем содержимое на PR'ы
    let currentPR = [];
    let currentPRTitle = '';
    let currentPRContent = '';
    
    for (let i = 0; i < h2Content.length; i++) {
      const item = h2Content[i];
      
      if (item.type === 'heading' && item.depth === 3) {
        // Если начинается новый PR, обрабатываем предыдущий
        if (currentPR.length > 0) {
          const module = detectModule(currentPRTitle, currentPRContent);
          if (!modulesMap.has(module)) {
            modulesMap.set(module, new Map());
          }
          if (!modulesMap.get(module).has(h2Title)) {
            modulesMap.get(module).set(h2Title, []);
          }
          modulesMap.get(module).get(h2Title).push([...currentPR]);
        }
        
        // Начинаем новый PR
        currentPRTitle = item.children[0].value;
        currentPR = [item];
        currentPRContent = currentPRTitle;
      } else if (currentPR.length > 0) {
        currentPR.push(item);
        // Собираем контент для анализа модуля
        if (item.type === 'paragraph' && item.children) {
          currentPRContent += ' ' + item.children.map(child => 
            child.type === 'text' ? child.value : ''
          ).join('');
        }
      }
    }
    
    // Обрабатываем последний PR
    if (currentPR.length > 0) {
      const module = detectModule(currentPRTitle, currentPRContent);
      if (!modulesMap.has(module)) {
        modulesMap.set(module, new Map());
      }
      if (!modulesMap.get(module).has(h2Title)) {
        modulesMap.get(module).set(h2Title, []);
      }
      modulesMap.get(module).get(h2Title).push([...currentPR]);
    }
  }
  
  // Формирование итогового дерева
  const finalChildren = [];
  
  // Добавляем модули в алфавитном порядке
  const sortedModules = Array.from(modulesMap.keys()).sort();
  
  for (const moduleName of sortedModules) {
    const moduleData = modulesMap.get(moduleName);
    
    // Добавляем заголовок модуля
    finalChildren.push({
      type: 'heading',
      depth: 2,
      children: [{ type: 'text', value: moduleName }]
    });
    
    // Добавляем типы изменений для этого модуля
    for (const [changeType, prs] of moduleData.entries()) {
      if (prs.length > 0) {
        // Добавляем заголовок типа изменения
        finalChildren.push({
          type: 'heading',
          depth: 3,
          children: [{ type: 'text', value: changeType }]
        });
        
        // Добавляем все PR'ы этого типа
        for (const pr of prs) {
          for (const item of pr) {
            finalChildren.push(item);
          }
        }
      }
    }
  }
  
  return {
    ...tree,
    children: finalChildren
  };
}
