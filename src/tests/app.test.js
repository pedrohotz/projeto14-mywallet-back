
import supertest from "supertest";
import index from "../../index.js";


describe('POST /sign-in', () => {

    it('returns 200 for valid sign-in',async () => {
        const result = await supertest(index).post('/sign-in').send({
            "email":"pedro@email.com",
            "senha":"batatafrita"
        })
        expect(result.status).toEqual(200);
    })

    it('returns 401 for invalid sign-in',async () => {
        const result = await supertest(index).post('/sign-in').send({
            "email":"pedro@email.com",
            "senha":"batataassada"
        })
        expect(result.status).toEqual(401);
    })
})


describe ('GET /userhistory', () => {
    
    it('returns 200 and data for valid get userhistory', async () => {
        const result = await supertest(index).get('/userhistory').set('Authorization','Bearer b8e08d13-cc96-44fe-b516-24f4516a7635');
        expect(result.status).toEqual(200);
    })

    it('returns 401 for invalid token get userhistory',async () => {
        const result = await supertest(index).get('/userhistory');
        expect(result.status).toEqual(401);
    })

})