import { Octokit } from "@octokit/rest";

const octokit = new Octokit({
  auth: process.env.MY_CUSTOM_PAT  // Sử dụng biến môi trường này
});

async function startCodespace() {
  try {
    const { data: codespaces } = await octokit.request('GET /user/codespaces');
    if (codespaces.length === 0) {
      await octokit.request('POST /user/codespaces');
      console.log('Codespace started successfully!');
    } else {
      console.log('Codespace is already running.');
    }
  } catch (error) {
    console.error('Error starting Codespace:', error.message);
  }
}

startCodespace();
