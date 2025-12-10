import { unified } from 'unified';
import remarkParse from 'remark-parse';
import remarkStringify from 'remark-stringify';

import * as core from '@actions/core';

import { groupByHeadingsLevel } from './groupByHeadingsLevel.js';
import { buildChangelogJson } from './buildChangelogJson.js';

async function run() {
    try {
        const data = core.getInput('data', { required: true });

        const changelog = await unified()
            .use(remarkParse)
            .use(() => groupByHeadingsLevel)
            .use(remarkStringify)
            .process(data);

        // Генерируем JSON структуру (Map сохраняем в file.data)
        const jsonData = buildChangelogJson(changelog.data?.componentsByH2);
        const jsonString = JSON.stringify(jsonData, null, 2);
        
        // Выводим JSON в логи
        core.info('📋 Generated changelog JSON:');
        core.info(jsonString);
        
        // Сохраняем outputs
        core.setOutput('changelog', changelog.toLocaleString());
        core.setOutput('changelog_json', jsonString);
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();
