const main = async function () {
  try {
    const go = new Go();
    const source = await fetch("hello.wasm");
    const result = await WebAssembly.instantiateStreaming(source, go.importObject);

    go.run(result.instance);

    ReactDOM.render(
      <p>Hello World!</p>,
      document.getElementById('app')
    );
  } catch (err) {
    console.error(err);
  }
};

main();
