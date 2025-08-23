const mySrvDemo = (srv) => {
  srv.on("myFunctionName", (req, res) => {
    return "Hello World" + req.data.msg;
  });
};

module.exports = mySrvDemo;
