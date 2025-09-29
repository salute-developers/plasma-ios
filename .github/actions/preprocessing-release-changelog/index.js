import { unified } from 'unified';
import remarkParse from 'remark-parse';
import remarkStringify from 'remark-stringify';

import * as core from '@actions/core';

async function run() {
    try {
        const data = core.getInput('data', { required: true });

        // Просто возвращаем данные как есть - группировка уже сделана в PR'ах
        const changelog = await unified()
            .use(remarkParse)
            .use(remarkStringify)
            .process(data);

        core.setOutput('changelog', changelog.toLocaleString());
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();
