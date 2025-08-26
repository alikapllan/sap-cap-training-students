module.exports = function () {
  this.before("READ", this.entities.Student, (req) => {
    console.log("myothersrv.js triggered!");
  });
};
