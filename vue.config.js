module.exports = {
    chainWebpack: config => {
        config.plugin('define').tap(args => {
            args[0]['process.env'].VUE_APP_BACKEND = '(window.env && window.env.VUE_APP_BACKEND ? window.env.VUE_APP_BACKEND : "http://localhost:8080")';
            return args;
        })
    }
}