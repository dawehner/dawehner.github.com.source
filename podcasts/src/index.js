import { Elm } from './Main.elm';

fetch('antennapod-feeds.json')
  .then(res => res.json())
  .then(json => {
    Elm.Main.init({
      node: document.getElementById('podcast-listing'),
      flags: json.children,
    });
  });
