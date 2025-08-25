const cds = require("@sap/cds");

module.exports = (srv) => {
  const { Student } = srv.entities; // use exposed entity

  srv.on("READ", "Student", async (req) => {
    const result = await cds.tx(req).run(SELECT.from(Student));
    console.log(result);
    return result;
  });
};
