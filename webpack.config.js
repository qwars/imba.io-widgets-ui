const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
const svgToMiniDataURI = require('mini-svg-data-uri');

// TODO: viewer *.md files
// const marked = require("marked");
// const renderer = new marked.Renderer();

const MetaTags = { author: "Alexandr Selunin; aka.qwars@gmail.com" };

module.exports = {
    context: __dirname + '/develop',
    target: 'web',
    devServer: {
        historyApiFallback: {
            rewrites: [
                {
                    from: /.*/,
                    to: function( context ){
                        return context.parsedUrl.pathname.match(/\.\w+$/) ? context.parsedUrl.pathname : '/index.html'
                    }
                }
            ]
        }
    },
    plugins: [
        new HtmlWebpackPlugin({
            title: 'Develop Input fields :: Work at home',
            favicon: './favicon.ico',
            scriptLoading: 'defer',
            // base: '/',
            meta: Object.assign({ viewport: 'width=device-width, initial-scale=1, shrink-to-fit=no' }, MetaTags )
        }),
        new HtmlWebpackPlugin({
            filename: '404.html',
            template: './404.html',
            inject: false
        }),
        new MiniCssExtractPlugin({ filename: 'styleshets/main.css' })
    ],
    optimization: {
        minimize: true,
        minimizer: [
            new CssMinimizerPlugin({
                minimizerOptions: { preset: [ 'default', { discardComments: { removeAll: true } } ] }
            })
        ]
    },
    module: {
	rules: [
            // TODO: load *.md files
            // {
            //     test: /\.md$/,
            //     use: [
            //         {
            //             loader: "html-loader"
            //         },
            //         {
            //             loader: "markdown-loader",
            //             options: {
            //                 pedantic: true,
            //                 renderer
            //             }
            //         }
            //     ]
            // },
            {
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components|javascripts)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env'],
                        pugins: ["@babel/plugin-proposal-class-properties"]
                    }
                }
            },
            // {
            //     test: /images.+\.(jpe?g|png|gif|svg|ico)$/,
            //     use: [{
            //         loader: 'file-loader',
            //         options: {
            //             name: '[name].[ext]',
            //             useRelativePath: true,
            //             outputPath: 'images',
            //             publicPath: '/images'
            //         }
            //     }]
            // },
            // {
            //     test: /fonts.+\.(woff(2)?|ttf|eot|svg)([?#]+\w+)?$/,
            //     use: [{
            //         loader: 'file-loader',
            //         options: {
            //             name: '[name].[ext]',
            //             useRelativePath: true,
            //             outputPath: 'fonts',
            //             publicPath: '/fonts'
            //         }
            //     }]
            // },
            {
                test: /\.(woff(2)?|ttf|eot|svg)([?#]+\w+)?$/,
                type: 'asset/resource',
            },
            {
                test: /\.styl$/i,
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader,
                        options: { publicPath: '/' }
                    },
                    { loader: 'css-loader', options: { sourceMap: true } },
                    {
                        loader: 'postcss-loader',
                        options: {
                            postcssOptions:{ plugins: [ 'postcss-preset-env' ] },
	                    sourceMap: true
	                }
                    },
                    { loader: 'stylus-loader', options: { sourceMap: true } }
                ]
            },
            {
	        test: /\.css$/,
                use: [                    
                    { loader: MiniCssExtractPlugin.loader },
                    { loader: 'css-loader', options: { sourceMap: true } },
                    {
                        loader: 'postcss-loader',
                        options: {
                            postcssOptions:{ plugins: [ 'postcss-preset-env' ] },
	                    sourceMap: true
	                }
                    }
                ]
	    },
	    {
		test: /\.imba$/,
		loader: 'imba/loader',
	    }
	]
    },
    resolve: {
	extensions: [".imba", ".js", ".json"]
    },
    entry: "./index.imba",
    output: {
	path: __dirname + "/public",
        publicPath: '/',
	filename: "javascripts/application.js",
        assetModuleFilename: 'assets/[hash][ext][query]'
    }
}
