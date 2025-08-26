module.exports = function () {
  const { InsertStudent } = this.entities; // 'this' is the service instance comes from mysimplesrv.js

  this.before("CREATE", InsertStudent, (req) => {
    const email = (req.data.email || "").toLowerCase();
    if (!email.endsWith("@example.com")) {
      req.error(400, "Only school email addresses allowed -> example.com");
    }
  });
};
