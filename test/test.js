const cds = require("@sap/cds");

// connection to db check
describe("Connect to DB in memory", () => {
  // each 'it' can be thought of a subtask
  it("Getting Sqlite in memory", async () => {
    await cds.deploy(__dirname + "/../db").to("sqlite::memory:");
    cds.model = await cds.load(__dirname + "/../db"); 
    expect(cds.model).toBeDefined(); // in expect we check if the cds model exists
  });
});
