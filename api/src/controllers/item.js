const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const create = async (req, res) => {
    try {
        const item = await prisma.item.create({
            data: req.body
        });
        return res.status(201).json(item);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
}

const read = async (req, res) => {
    const itens = await prisma.item.findMany();
    return res.json(itens);
}

const readOne = async (req, res) => {
    try {
        const item = await prisma.item.findUnique({
            where: {
                id: Number(req.params.id)
            },
            include: {
                pedido: {
                    select: {
                        id: true,
                        data: true,
                        cliente: true,
                        valor: true
                    }
                },
                pizza: true,
            }
        });
        return res.json(item);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
}

const update = async (req, res) => {
    try {
        const item = await prisma.item.update({
            where: {
                id: Number(req.params.id)
            },
            data: req.body
        });
        return res.status(202).json(item);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
}

const remove = async (req, res) => {
    try {
        await prisma.item.delete({
            where: {
                id: Number(req.params.id)
            }
        });
        return res.status(204).send();
    } catch (error) {
        return res.status(404).json({ error: error.message });
    }
}

module.exports = { create, read, readOne, update, remove };