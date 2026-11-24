/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html",
    "./product/*.html",
    "./supplier/*.html",
    "./supplier/*/*.html"
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          orange: '#EA580C',
          ember: '#D97706',
          dark: '#0B1120',
          charcoal: '#151E2E',
          surface: '#F8FAFC',
          muted: '#64748B'
        }
      },
      fontFamily: {
        sans: ['"Plus Jakarta Sans"', 'sans-serif'],
        serif: ['"DM Serif Display"', 'serif'],
        brand: ['"Montserrat"', '"Plus Jakarta Sans"', 'sans-serif'],
      },
      boxShadow: {
        'glow': '0 10px 40px -10px rgba(234, 88, 12, 0.45)',
        'float': '0 20px 40px -10px rgba(0,0,0,0.1)',
      }
    }
  },
  plugins: [],
}
