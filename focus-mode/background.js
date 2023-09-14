const extensionsDocsUrlPrefix = 'https://developer.chrome.com/docs/extensions';
const webStoreDocsUrlPrefix = 'https://developer.chrome.com/docs/webstore';

chrome.action.onClicked.addListener(async (tab) => {
  if (
    tab.url.startsWith(extensionsDocsUrlPrefix)
    || tab.url.startsWith(webStoreDocsUrlPrefix)
  ) {
    const prevState = await chrome.action.getBadgeText({ tabId: tab.id });
    const nextState = prevState === 'ON' ? 'OFF' : 'ON';

    await chrome.action.setBadgeText({
      tabId: tab.id,
      text: nextState,
    });
  }
});
