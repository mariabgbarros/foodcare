module.exports = {
    dialect: 'postgres',
    dialectOptions: {
        options: {
            encrypt: false,
            validateBulkLoadParameters: true
        },
    },
    host: 'ec2-34-203-182-65.compute-1.amazonaws.com',
    user: 'hiqrayikkraxqf',
    password: '7ab318d10817ad647f2be9dadfeb85235c1b5da431214f7743b8d04a3100a828',
    database: 'd4afo85q39r002',
    port: 5432,
    define: {
        timestamps: true,
        freezeTableName: false,
    }
};