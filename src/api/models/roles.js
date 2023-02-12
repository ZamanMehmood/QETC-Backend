'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Roles extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }

  Roles.init({
    title: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },

    addUni: { type: DataTypes.Boolean, defaultValue: false },
    editUni: { type: DataTypes.Boolean, defaultValue: false },
    deleteUni: { type: DataTypes.Boolean, defaultValue: false },
    viewUni: { type: DataTypes.Boolean, defaultValue: false },

    addUProgram: { type: DataTypes.Boolean, defaultValue: false },
    editUProgram: { type: DataTypes.Boolean, defaultValue: false },
    deleteUProgram: { type: DataTypes.Boolean, defaultValue: false },
    viewUProgram: { type: DataTypes.Boolean, defaultValue: false },

    addLeads: { type: DataTypes.Boolean, defaultValue: false },
    editLeads: { type: DataTypes.Boolean, defaultValue: false },
    deleteLeads: { type: DataTypes.Boolean, defaultValue: false },
    viewLeads: { type: DataTypes.Boolean, defaultValue: false },

    addApplication: { type: DataTypes.Boolean, defaultValue: false },
    editApplication: { type: DataTypes.Boolean, defaultValue: false },
    deleteApplication: { type: DataTypes.Boolean, defaultValue: false },
    viewApplication: { type: DataTypes.Boolean, defaultValue: false },

    addApplicationStatus: { type: DataTypes.Boolean, defaultValue: false },
    editApplicationStatus: { type: DataTypes.Boolean, defaultValue: false },
    deleteApplicationStatus: { type: DataTypes.Boolean, defaultValue: false },
    viewApplicationStatus: { type: DataTypes.Boolean, defaultValue: false },

    addInvCommission: { type: DataTypes.Boolean, defaultValue: false },
    editInvCommission: { type: DataTypes.Boolean, defaultValue: false },
    deleteInvCommission: { type: DataTypes.Boolean, defaultValue: false },
    viewInvCommission: { type: DataTypes.Boolean, defaultValue: false },


    addInvGeneral: { type: DataTypes.Boolean, defaultValue: false },
    editInvGeneral: { type: DataTypes.Boolean, defaultValue: false },
    deleteInvGeneral: { type: DataTypes.Boolean, defaultValue: false },
    viewInvGeneral: { type: DataTypes.Boolean, defaultValue: false },

    addAccounting: { type: DataTypes.Boolean, defaultValue: false },
    editAccounting: { type: DataTypes.Boolean, defaultValue: false },
    deleteAccounting: { type: DataTypes.Boolean, defaultValue: false },
    viewAccounting: { type: DataTypes.Boolean, defaultValue: false },

    // title: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Roles',
  });
  return Roles;
};