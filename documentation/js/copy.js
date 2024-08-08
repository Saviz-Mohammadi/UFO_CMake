function copyCode(button)
{
  // Find the closest parent `.code-container` of the clicked button
  const codeContainer = button.closest('.code-container');

  // Select the `pre` element within that `.code-container`
  const pre = codeContainer.querySelector('pre').textContent;

  navigator.clipboard.writeText(pre)
  .then(() =>
  {
    alert('Code copied to clipboard!');
  })
  .catch(err =>
  {
    console.error('Failed to copy code: ', err);
  });
}




function copyEmail()
{
  const email = 'savizmohammadi@yahoo.com';

  // Use the Clipboard API to copy the email address
  navigator.clipboard.writeText(email).then(() =>
  {
    alert('Email copied to clipboard!');
  });
}
