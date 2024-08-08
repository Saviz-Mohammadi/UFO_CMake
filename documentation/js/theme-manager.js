document.addEventListener('DOMContentLoaded', () =>
{
  // Function to apply the theme based on localStorage
  const applyTheme = () =>
  {
    const theme = localStorage.getItem('theme');

    if (theme === 'dark')
    {
      document.body.classList.add('darkmode');
      document.body.classList.remove('lightmode');
    }

    else
    {
      document.body.classList.add('lightmode');
      document.body.classList.remove('darkmode');
    }
  };

  // Apply the theme when the DOM is ready
  applyTheme();
});


function toogleTheme()
{
  const currentTheme = localStorage.getItem('theme');

  if (currentTheme === 'dark')
  {
    document.body.classList.remove('darkmode');
    document.body.classList.add('lightmode');

    localStorage.setItem('theme', 'light');
  }

  else
  {
    document.body.classList.remove('lightmode');
    document.body.classList.add('darkmode');

    localStorage.setItem('theme', 'dark');
  }
}
