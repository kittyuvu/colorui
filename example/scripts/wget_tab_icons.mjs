import * as http from 'https'
import * as fs from 'fs'

const $ = (name) => `https://uni-cu-h5-izaizaia.vercel.app/static/tab_icon/${name}.png`

function wget(url, path) {
  return new Promise((resolve, reject) => {
    http.get(url, (res) => {
      if (res.statusCode === 200) {
        const file = fs.createWriteStream(path);
        res.pipe(file);
        res.on('end', () => {
          resolve(path);
        });
      } else {
        reject(new Error(`Request Failed.\nStatus Code: ${res.statusCode}`));
      }
    }).on('error', (err) => {
      reject(err);
    });
  });
}

; (async () => {
  let $tabs = ["tpl", "comment", "find", "my", "document"]
  $tabs = $tabs.map(item => {
    return {
      icon: item,
      curr: `${item}_cur`
    }
  })
  $tabs.forEach(async item=> {
    console.log(`download ${item.icon}`)
    await wget($(item.icon), `../assets/tabs/${item.icon}.png`)
    await wget($(item.curr), `../assets/tabs/${item.curr}.png`)
  })
})()