const opmlToJSON = require('opml-to-json');
const fs = require('fs');

const opml = fs.readFileSync('./public/antennapod-feeds.opml');

opmlToJSON(opml, (err, json) => {
  if (err) {
    console.error(err);
    process.exit(1);
  }

  fs.writeFileSync('./public/antennapod-feeds.json', JSON.stringify(json, null, 2));
});



