const db = require("../../models");
const Users = db.Users;

exports.createUser = async (req, res, next) => {
  try {
    console.log("Req.body users controller =====>", req.body);

    let users = {
      name: req.body.name,
      email: req.body.email,
      number: req.body.number,
      role: req.body.role,
      branch: req.body.branch,
      position: req.body.position,
      date: req.body.date,
    };
    console.log(" inside if block");

    //save the users in db
    users = await Users.create(users);
    return res.json({
      success: true,
      data: users,
      message: "user created successfully",
    });
  } catch (err) {
    console.log("Error handling =>", err);
    console.log("inside catch block");
    next();
  }
};

exports.listUsers = async (req, res, next) => {
  try {
    const uni = await Users.findAndCountAll();

    let { page, limit, name } = req.query;

    // console.log("unitt", uni.count);
    // console.log("req.queryy", req.query); //name
    const filter = {};

    page = page !== undefined && page !== "" ? parseInt(page) : 1;
    limit = limit !== undefined && limit !== "" ? parseInt(limit) : 10;

    if (name) {
      filter.name = { $LIKE: name, $options: "gi" };
    }

    const total = uni.count;

    if (page > Math.ceil(total / limit) && total > 0)
      page = Math.ceil(total / limit);

    console.log("filter", filter);
    const faqs = await Users.findAll(
      { $WHERE: filter },
      { "$ORDER BY": { createdAt: -1 } },
      { $offest: limit * (page - 1) },
      { $LIMIT: limit }
    );
    console.log("faqs", faqs);
    // res.send(uni);
    return res.send({
      success: true,
      message: "Programms fetched successfully",
      data: {
        faqs,
        pagination: {
          page,
          limit,
          total,
          pages: Math.ceil(total / limit) <= 0 ? 1 : Math.ceil(total / limit),
        },
      },
    });
  } catch (err) {
    res.send("programme Error " + err);
  }
  // next();
};
