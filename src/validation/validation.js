import joi from 'joi';


const userValidation = joi.object({
    nome: joi.string().min(4).required(),
    email: joi.string().email().required(),
    senha: joi.string().alphanum().min(5).required()
})


const userValidationLogin = joi.object({
    email: joi.string().email().required(),
    senha: joi.string().alphanum().min(5).required(),
})



export {
    userValidation,
    userValidationLogin,
}