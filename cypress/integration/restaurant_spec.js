describe('My First Test', () => {
  it('Visits the restaurants index page', () => {
    cy.visit('http://localhost:3000/restaurants')
  })
})
