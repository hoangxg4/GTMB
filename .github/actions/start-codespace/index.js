const { Octokit } = require("@octokit/rest");

async function startCodespace(token) {
  const octokit = new Octokit({ auth: token });

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

module.exports = startCodespace;
