module.exports = {
    mount: {
        src: '/dist',
        public: '/'
    },
    plugins: [
        [
            '@snowpack/plugin-build-script',
            { cmd: 'postcss', input: ['.css'], output: ['.css'] },
        ],
        'snowpack-plugin-elm'
    ]
};