const db = require("../../models");
const Currency = db.Currency;
const Activity = db.Activity;

// create Currency
exports.create = async (req, res, next) => {
  try {
    let payload = req.body;

    console.log("payload of create currency", payload);
    //save the currency in db
    let currency = await Currency.create(payload);

    await Activity.create({ action: "New Currency created", userId: 1 });

    return res.json({
      success: true,
      data: currency,
      message: "currency created successfully",
    });
  } catch (err) {
    next();
  }
};

// list Currencyies
exports.list = async (req, res, next) => {
  try {
    const uni = await Currency.findAndCountAll();

    let { page, limit, name } = req.query;

    console.log("unitt", uni.count);
    console.log("req.queryy", req.query); //name
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
    const faqs = await Currency.findAll({
      order: [["updatedAt", "DESC"]],
      offset: limit * (page - 1),
      limit: limit,
      where: filter,
    });
    console.log("faqs", faqs);
    // res.send(uni);
    return res.send({
      success: true,
      message: "currency fetched successfully",
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
    res.send("currency Error " + err);
  }
  // next();
};

// API to edit currency
exports.edit = async (req, res, next) => {
  try {
    let payload = req.body;
    console.log("edit payload =>", payload);

    const currency = await Currency.update(
      // Values to update
      payload,
      {
        // Clause
        where: {
          id: payload.id,
        },
      }
    );

    console.log("edit cur currrr =>", currency);
    await Activity.create({ action: "New Currency updated", userId: 1 });

    return res.send({
      success: true,
      message: "currency updated successfully",
      currency,
    });
  } catch (error) {
    return next(error);
  }
};

// API to delete currency
exports.delete = async (req, res, next) => {
  try {
    const { id } = req.params;
    if (id) {
      const currency = await Currency.destroy({ where: { id: id } });
      await Activity.create({ action: "New Currency deleted", userId: 1 });

      if (currency)
        return res.send({
          success: true,
          message: "currency Page deleted successfully",
          id,
        });
      else
        return res.status(400).send({
          success: false,
          message: "currency Page not found for given Id",
        });
    } else
      return res
        .status(400)
        .send({ success: false, message: "currency Id is required" });
  } catch (error) {
    return next(error);
  }
};

// API to get  by id a currency
exports.get = async (req, res, next) => {
  try {
    const { id } = req.params;
    if (id) {
      const currency = await Currency.findByPk(id);

      if (currency)
        return res.json({
          success: true,
          message: "currency retrieved successfully",
          currency,
        });
      else
        return res.status(400).send({
          success: false,
          message: "currency not found for given Id",
        });
    } else
      return res
        .status(400)
        .send({ success: false, message: "currency Id is required" });
  } catch (error) {
    return next(error);
  }
};
