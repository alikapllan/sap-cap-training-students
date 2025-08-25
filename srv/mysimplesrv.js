const cds = require("@sap/cds");

module.exports = (srv) => {
  const { Student } = srv.entities; // use exposed entity

  srv.on("READ", "Student", async (req) => {
    const result = await cds.tx(req).run(SELECT.from(Student));
    console.log(result);
    return result;
  });
};

// Another way of writing
module.exports = cds.service.impl(async function () {
  const { Student } = this.entities;

  this.on("READ", Student, async (req) => {
    // const result = await SELECT.from(Student); --> also same result 
    const result = await cds.tx(req).run(SELECT.from(Student));
    /*
    cds.tx(req) binds the query to the same connection/context as the request.
    This ensures:
      - If multiple DB operations happen, they are all committed/rolled back together.
      - Authorizations / tenant info from req are respected.
      - Works consistently in multi-tenant and production scenarios (HANA HDI, etc).
    */
    console.log(result);
    return result;
  });
});
