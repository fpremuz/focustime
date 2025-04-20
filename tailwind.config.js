module.exports = {
  darkMode: 'class',
  content: [
    "./app/views/**/*.{html,erb}",
    "./app/javascript/**/*.js",
    "./app/helpers/**/*.rb"
  ],
  safelist: [
    'dark',
    {
      pattern: /dark:(bg|text)-(gray|white|black|blue|red|green)-\d{2,3}/,
      variants: ['dark'],
    }
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}