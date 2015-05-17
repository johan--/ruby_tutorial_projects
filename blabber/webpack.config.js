module.exports = {
  entry: {
    app: ['./node_modules/webpack/hot/dev-server','./client/main.jsx']
  },
  output: {
    path: './public',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.css$/, loader: 'style!css' },
      { test: /\.jsx$/, loader: 'jsx-loader' }
    ]
  }
};
