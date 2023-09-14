const article = document.querySelector('article');

if (article) {
  const text = article.textContent;

  const wordMatchRegExp = /[^\s]+/g;
  const words = text.matchAll(wordMatchRegExp);
  const wordCount = [...words].length;

  const readingPaceInWordsPerMinute = 200;
  const readingTimeInMinutes = Math.ceil(wordCount / readingPaceInWordsPerMinute);

  const readingTimeTag = document.createElement('p');
  readingTimeTag.classList.add('color-secondary-text', 'type--caption');
  readingTimeTag.textContent = `⏱️ ${readingTimeInMinutes} minute read`;

  const heading= article.querySelector('h1');
  const date = article.querySelector('time')?.parentElement;

  (date ?? heading).insertAdjacentElement('afterend', readingTimeTag);
}
