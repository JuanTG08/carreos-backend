const testCtrl = {};

testCtrl.Test = (req, res) => {
    res.json({ error: false })
    console.log("test");
}

module.exports = testCtrl;