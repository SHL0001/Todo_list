// webpack needs to be explicitly required
const webpack = require('webpack')
const {environment} = require("@rails/webpacker");

module.exports = {

    /* ... rest of the config here ... */

    plugins: [
        // fix "process is not defined" error:
        // (do "npm install process" before running the build)
        new webpack.ProvidePlugin({
            process: 'process/browser',
        }),
    ]
}
module.exports=environment