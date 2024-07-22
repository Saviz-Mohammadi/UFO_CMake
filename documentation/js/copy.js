function copyCode()
{
  const codeContainer = document.querySelector('.code-container');
  const code = codeContainer.querySelector('code');

  const textarea = document.createElement('textarea');
  textarea.value = code.textContent;
  document.body.appendChild(textarea);

  textarea.select();
  document.execCommand('copy');
  textarea.remove();

  alert('Code copied to clipboard!');
}