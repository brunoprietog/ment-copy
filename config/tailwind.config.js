const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require("tailwindcss/colors")

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        primary: [...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: '#028667',
        secondary: '#b9dfd6',
        darkbg: '#313b4b',
        dark: '#404D62',
        light: '#FFFFFF',
        lightbg: '#f0f2f5',
        lightred: "#fecaca",
        darkred: "#f87171"
      },
      backgroundImage: {}
    },
    container: {
      center: true,
    },
    screens: {
      'sm': '450px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px',
    }
  },
  darkMode: 'media'
}
