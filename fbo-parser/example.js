var fs = require("fs");
var parser = require("./index");

fs.writeFileSync('./out/FBOFeed20190529.json', JSON.stringify(parser.parse(fs.readFileSync('./in/FBOFeed20190529.txt', 'UTF-8'))));
