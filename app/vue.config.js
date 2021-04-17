module.exports = {

    publicPath: '/',
    outputDir: 'dist',
    assetsDir: 'static',
    lintOnSave: process.env.NODE_ENV === 'development',
    productionSourceMap: false,
    devServer: {
      // port: port,
      // open: true,
      // overlay: {
      //   warnings: false,
      //   errors: true
      // },
      proxy: {
              '/api': {
          target: process.env.VUE_APP_HOST + '/api',
                  changeOrigin: true,
                  pathRewrite: {
                      '^/api': ''
                  }
              }
    }
}
}