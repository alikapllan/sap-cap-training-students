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

describe("Testing CatalogServiceLMS", () => {
  it("Service Existing Check", async () => {
    let srv = await cds.serve("CatalogServiceLMS").from(__dirname + "/");
    expect(srv.name).toMatch("CatalogServiceLMS");
  });

  it("Select on Student With Value", async () => {
    const db = await cds.connect.to("db");
    const { Student } = cds.entities("my.LMS");

    const row = await db.run(
      SELECT.one
        .from(Student, (c) => {
          c.email, c.first_name, c.last_name, c.date_sign_up;
        })
        .where({ first_name: "demo" })
    );

    expect(row).toMatchObject({ email: "demo@demo.com" });
  });

  it("Update on Student With Value", async () => {
    const { Student } = cds.entities("my.LMS");
    return UPDATE(Student)
      .set({ first_name: "dave" })
      .where({ email: "demo@demo.com" });
  });

  it("Insert on Student With Value", async () => {
    const { Student } = cds.entities("my.LMS");
    return INSERT.into(Student).entries({
      email: "exampleemail@example.com",
      first_name: "IHateMyLife",
      last_name: "IWannaDie",
    });
  });

  it("Navigation of Student to enrollment to course", async () => {
    let app = require("express"); // already a part of CAPM
    let srv = require("supertest")(app); // mock service

    let { body } = srv.get(
      "/catalog-service-lms/GetStudent(ID=c9e78068-ddff-4f29-b71c-c4e0cf59c850,%20IsActiveEntity=true)/enrollment(ID=c9e78068-ddff-4f29-b71c-c4e0cf59d851,IsActiveEntity=true)/course"
    );

    expect(body);
  });
});
