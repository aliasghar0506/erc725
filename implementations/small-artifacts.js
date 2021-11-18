/**
 * This script removes source + AST entries inside the JSON ABIs generated by `truffle conpile`
 * in order to generate smaller file sizes (truffle generated ABI files usually
 * contain around 5,000 to 20,000 lines).
 *
 * This script is useful when deploying to a package registry like npm, as it helps in:
 *  - optimizing package size
 *  - generated safer to use files, as some files contain sensitive informations
 *      (they key "sourcePath" in the artifacts generated by truffle contains the File system path
 *      of the user that compiled the contracts via `truffle compile` command)
 *
 * @see Github https://github.com/trufflesuite/truffle/issues/1269
 */
const fs = require("fs");
const TruffleConfig = require("@truffle/config");

// find config file & return new TruffleConfig object with config file settings (cwd)
const truffleConfig = TruffleConfig.detect();
const artifactsFolder = truffleConfig.contracts_build_directory;

function generateSmallerArtifact(_file) {
  fs.readFile(_file, (err, fileContent) => {
    if (err) console.error(`Error reading file: ${err}`);

    let jsonArtifact = JSON.parse(fileContent);
    removeSourcesEntries(jsonArtifact);
    removeASTEntries(jsonArtifact);

    fs.writeFile(_file, JSON.stringify(jsonArtifact), (err) => {
      err |
        console.log(
          "\u2713 Smaller JSON artifact created for -> ",
          _file.replace(artifactsFolder + "/", "")
        );
    });
  });
}

function removeSourcesEntries(_content) {
  const sourceEntries = [
    "generatedSources",
    "deployedGeneratedSources",
    "sourceMap",
    "deployedSourceMap",
    "source",
    "sourcePath",
  ];
  sourceEntries.map((entry) => delete _content[entry]);
}

function removeASTEntries(_content) {
  const astEntries = ["ast", "legacyAST"];
  astEntries.map((entry) => delete _content[entry]);
}

fs.readdir(artifactsFolder, (err, files) => {
  if (err) console.error(`Error reading 'artifacts/' directory: ${err}`);
  for (const file of files) {
    generateSmallerArtifact(artifactsFolder + "/" + file);
  }
});
