const db = require("../../models");
const University = db.University;
const Campus = db.Campus;

// create university
exports.createUniversity = async (req, res, next) => {
  try {
    console.log("REq.body", req.body);
    console.log("req file", req.file);
    //create new record in db
    let university = {
      logo: req.file.filename,
      // image: req.file.filename,
      name: req.body.name,
      type: req.body.type,
      counserllerName: req.body.counserllerName,
      phone: req.body.phone,
      email: req.body.email,
      visaAppFee: req.body.visaAppFee,
      addmissionFee: req.body.addmissionFee,
      qetcFee: req.body.qetcFee,
      commisionDuration: req.body.commisionDuration,
    };
    university = await University.create(university);
    console.log("universityId", university);
    console.log("campuss", req.body.campuses);

    const newArr = JSON.parse(req.body.campuses);
    console.log("newArrr", newArr.length);
    const mappedArr = newArr.map(async (ele, ind) => {
      let campus = {
        name: ele.name,
        address1: ele.address1,
        address2: ele.address2,
        phone: ele.phone,
        email: ele.email,
        isMain: ele.isMain,
        UniversityId: university.dataValues.id,
      };
      campus = await Campus.create(campus);
    });
    console.log("mapped arrrr ==>", mappedArr);
    return res.send({
      success: true,
      data: university,
      msg: "university created successfully",
    });
  } catch (err) {
    console.log("Error handling =>", err);
    next();
  }
};

// list university
// exports.listUniversity = async (req, res, next) => {
//         // console.log("req.query",req.query)
//   try {
//     const uni = await University.findAll();
//     res.send(uni);
//   } catch (err) {
//     res.send("University Error " + err);
//   }
// };

exports.listUniversity = async (req, res, next) => {
  // console.log("req.query",req.query);
  try {
    const uni = await University.findAndCountAll();
    let { page, limit, name } = req.query;

    console.log("unitt", uni.count);
    console.log("req.queryy", req.query); //name
    const filter = {};

    page = page !== undefined && page !== "" ? parseInt(page) : 1;
    limit = limit !== undefined && limit !== "" ? parseInt(limit) : 10;

    if (name) {
      filter.name = { $LIKE: name, $options: "gi" };
    };

    const total = uni.count;

    if (page > Math.ceil(total / limit) && total > 0)
      page = Math.ceil(total / limit);

       console.log("filter",filter)
    const faqs = await University.findAll(
      { $WHERE: filter },
      { "$ORDER BY": { createdAt: -1 } },
      { $offest: limit * (page - 1) },
      { $LIMIT: limit }
    );
    console.log("faqs", faqs);
    // res.send(uni);
    return res.send({
      success: true,
      message: "FAQs fetched successfully",
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
    res.send("University Error " + err);
  }
};

// exports.listUniversity = async (req, res, next) => {
//   console.log("req.query", req.query);
//   // console.log("Universityy", University)

//   try {
//     let { page, limit } = req.query; //name
//     const filter = {};

//     page = page !== undefined && page !== "" ? parseInt(page) : 1;
//     limit = limit !== undefined && limit !== "" ? parseInt(limit) : 10;

//     if (name) {
//       filter.name = { $Like: "b%" };
//     }

//     const total = await ("SELECT COUNT(*) FROM Universities", filter);
//     // const total =50

//     if (page > Math.ceil(total / limit) && total > 0)
//       page = Math.ceil(total / limit);

//     const faqs = await University.findAll(
//       { $WHERE: filter },
//       { "$ORDER BY": { createdAt: -1 } },
//       { $offest: limit * (page - 1) },
//       { $LIMIT: limit }
//     );
//     console.log("faqsss", faqs);

//     // const uni = await University.findAll();
//     // res.json(uni);
//     return res.json({
//       success: true,
//       message: "FAQs fetched successfully",
//       data: {
//         faqs,
//         pagination: {
//           page,
//           limit,
//           total,
//           pages: Math.ceil(total / limit) <= 0 ? 1 : Math.ceil(total / limit),
//         },
//       },
//     });
//     // }
//   } catch (err) {
//     res.send("University Error " + err);
//   }
// };

// exports.list = async (req, res, next) => {
//   try {
//       let { page, limit, title, status } = req.query        //name
//       const filter = {}

//       page = page !== undefined && page !== '' ? parseInt(page) : 1
//       limit = limit !== undefined && limit !== '' ? parseInt(limit) : 10

//       if (title) {
//           filter.title = { $regex: title, $options: "gi" }
//       }
//       if (status) {
//           if(status === 'true'){
//               filter.status = true
//           }
//           else if(status === 'false'){
//               filter.status = false
//           }
//       }

//       const total = await FAQ.countDocuments(filter)

//       if (page > Math.ceil(total / limit) && total > 0)
//           page = Math.ceil(total / limit)

//       const faqs = await FAQ.aggregate([
//           { $match: filter },
//           { $sort: { createdAt: -1 } },
//           { $skip: limit * (page - 1) },
//           { $limit: limit },
//           {
//               $project: {
//                   _id: 1, title: 1, status: 1, desc: 1
//               }
//           }
//       ])

//       return res.send({
//           success: true, message: 'FAQs fetched successfully',
//           data: {
//               faqs,
//               pagination: {
//                   page, limit, total,
//                   pages: Math.ceil(total / limit) <= 0 ? 1 : Math.ceil(total / limit)
//               }
//           }
//       })
//   } catch (error) {
//       return next(error)
//   }
// }
