const fs = require('fs')
const files = fs.readdirSync('./issues/')

const output = []
files.forEach((fileName) => {
  const list = JSON.parse(fs.readFileSync(`./issues/${fileName}`, 'utf8'));
  output.push(...list)
})

fs.writeFile('issues.json', JSON.stringify(output), 'utf8', (err) => {
  if (err) throw err
    console.log('Запись в файл завершена')
  }
);