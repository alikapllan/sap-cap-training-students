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
  const { Student, UpdateStudent } = this.entities;

  this.on("READ", Student, async (req) => {
    // const result = await SELECT.from(Student); --> also same result

    const result_where_hardcoded = await cds.tx(req).run(
      SELECT.from(Student).where({ email: "alice.wonderland@example.com" }) // one way of where statement
    );

    /*
    cds.tx(req) binds the query to the same connection/context as the request.
    This ensures:
      - If multiple DB operations happen, they are all committed/rolled back together.
      - Authorizations / tenant info from req are respected.
      - Works consistently in multi-tenant and production scenarios (HANA HDI, etc).
    */

    // If caller passes ?$filter=email eq 'alice.wonderland@example.com' or /odata/v4/catalog/Student(email='alice.wonderland@example.com')
    // CAP already translates it into req.query
    const result = await cds.tx(req).run(req.query);
    console.log(result);
    return result;
  });

  this.after("READ", Student, (data) => {
    // changing values possible
    return data.map((d) => {
      d.first_name = d.first_name + " " + d.last_name;
      return d;
    });

    // doesnt work. As filtering etc. not possible in .after event
    // let finalValue = data.filter((d) => d.first_name === "Alice");
    // console.log(finalValue);
    // return finalValue;
  });

  this.on("UPDATE", UpdateStudent, async (req, res) => {
    let firstName = req.data.first_name;
    const studentEmail = req.data.email;

    let result = await UPDATE(Student)
      .set({ first_name: firstName })
      .where({ email: studentEmail });

    console.log(
      result === 0
        ? "No student found for update"
        : `Update successful, ${result} row(s) affected`
    );

    return req.data;
  });
});
