import * as core from '@actions/core';

async function run() {
    try {
        const data = core.getInput('data', { required: true });

        // Просто возвращаем данные как есть - описания PR'ов уже в правильном формате
        core.setOutput('changelog', data);
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();
