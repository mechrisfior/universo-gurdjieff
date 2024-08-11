import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
    // Inserimento delle forze cosmiche
    const forzaAttiva = await prisma.forze.create({
        data: {
            nome: 'Forza Attiva',
            descrizione: 'Questa è la forza attiva che guida l’evoluzione.',
            tipo: 'Attiva',
            intensita: 1.0,
            origine: 'Cosmica',
        },
    });

    const forzaPassiva = await prisma.forze.create({
        data: {
            nome: 'Forza Passiva',
            descrizione: 'Questa è la forza passiva che resiste ai cambiamenti.',
            tipo: 'Passiva',
            intensita: 0.5,
            origine: 'Terrestre',
        },
    });

    const forzaNeutra = await prisma.forze.create({
        data: {
            nome: 'Forza Neutra',
            descrizione: 'Questa è la forza neutra che bilancia attiva e passiva.',
            tipo: 'Neutra',
            intensita: 0.8,
            origine: 'Galattica',
        },
    });

    // Inserimento di ottave
    const ottavaSole = await prisma.ottave.create({
        data: {
            nome: 'Ottava del Sole',
            frequenza_iniziale: 432.0,
            frequenza_finale: 864.0,
            forza_id: forzaAttiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione solare.',
            livello: 1,
        },
    });

    const ottavaGiove = await prisma.ottave.create({
        data: {
            nome: 'Ottava di Giove',
            frequenza_iniziale: 216.0,
            frequenza_finale: 432.0,
            forza_id: forzaNeutra.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione di Giove.',
            livello: 2,
        },
    });

    const ottavaMarte = await prisma.ottave.create({
        data: {
            nome: 'Ottava di Marte',
            frequenza_iniziale: 108.0,
            frequenza_finale: 216.0,
            forza_id: forzaAttiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione marziana.',
            livello: 3,
        },
    });

    const ottavaTerra = await prisma.ottave.create({
        data: {
            nome: 'Ottava della Terra',
            frequenza_iniziale: 54.0,
            frequenza_finale: 108.0,
            forza_id: forzaNeutra.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione della Terra.',
            livello: 4,
        },
    });

    const ottavaVenere = await prisma.ottave.create({
        data: {
            nome: 'Ottava di Venere',
            frequenza_iniziale: 27.0,
            frequenza_finale: 54.0,
            forza_id: forzaPassiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione di Venere.',
            livello: 5,
        },
    });

    const ottavaMercurio = await prisma.ottave.create({
        data: {
            nome: 'Ottava di Mercurio',
            frequenza_iniziale: 13.5,
            frequenza_finale: 27.0,
            forza_id: forzaAttiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione di Mercurio.',
            livello: 6,
        },
    });

    const ottavaLuna = await prisma.ottave.create({
        data: {
            nome: 'Ottava della Luna',
            frequenza_iniziale: 6.75,
            frequenza_finale: 13.5,
            forza_id: forzaPassiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione lunare.',
            livello: 7,
        },
    });

    // Inserimento di vibrazioni associate alle ottave
    await prisma.vibration.createMany({
        data: [
            { frequenza: 432.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaSole.id },
            { frequenza: 648.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaSole.id },
            { frequenza: 864.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaSole.id },
            { frequenza: 216.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaGiove.id },
            { frequenza: 324.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaGiove.id },
            { frequenza: 432.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaGiove.id },
            { frequenza: 108.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaMarte.id },
            { frequenza: 162.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaMarte.id },
            { frequenza: 216.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaMarte.id },
            { frequenza: 54.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaTerra.id },
            { frequenza: 81.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaTerra.id },
            { frequenza: 108.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaTerra.id },
            { frequenza: 27.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaVenere.id },
            { frequenza: 40.5, intensita: 0.8, fase: 'medio', ottava_id: ottavaVenere.id },
            { frequenza: 54.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaVenere.id },
            { frequenza: 13.5, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaMercurio.id },
            { frequenza: 20.25, intensita: 0.8, fase: 'medio', ottava_id: ottavaMercurio.id },
            { frequenza: 27.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaMercurio.id },
            { frequenza: 6.75, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaLuna.id },
            { frequenza: 10.125, intensita: 0.8, fase: 'medio', ottava_id: ottavaLuna.id },
            { frequenza: 13.5, intensita: 0.6, fase: 'finale', ottava_id: ottavaLuna.id },
        ],
    });

    // Inserimento di idrogeni associati alle ottave
    await prisma.idrogeni.createMany({
        data: [
            { nome: 'H3', densita: 3, energia: 3000, ottava_id: ottavaSole.id },
            { nome: 'H6', densita: 6, energia: 1500, ottava_id: ottavaGiove.id },
            { nome: 'H12', densita: 12, energia: 800, ottava_id: ottavaMarte.id },
            { nome: 'H24', densita: 24, energia: 400, ottava_id: ottavaTerra.id },
            { nome: 'H48', densita: 48, energia: 200, ottava_id: ottavaVenere.id },
            { nome: 'H96', densita: 96, energia: 100, ottava_id: ottavaMercurio.id },
            { nome: 'H192', densita: 192, energia: 50, ottava_id: ottavaLuna.id },
        ],
    });

    // Inserimento di carte associate agli eventi
    await prisma.carte.createMany({
        data: [
            { nome: 'Carta del Sole', descrizione: 'Carta associata al Sole.', tipo: 'Sole', ottava_id: ottavaSole.id },
            { nome: 'Carta della Luna', descrizione: 'Carta associata alla Luna.', tipo: 'Luna', ottava_id: ottavaLuna.id },
            { nome: 'Carta della Terra', descrizione: 'Carta associata alla Terra.', tipo: 'Terra', ottava_id: ottavaTerra.id },
            { nome: 'Carta di Marte', descrizione: 'Carta associata a Marte.', tipo: 'Marte', ottava_id: ottavaMarte.id },
            { nome: 'Carta di Venere', descrizione: 'Carta associata a Venere.', tipo: 'Venere', ottava_id: ottavaVenere.id },
            { nome: 'Carta di Mercurio', descrizione: 'Carta associata a Mercurio.', tipo: 'Mercurio', ottava_id: ottavaMercurio.id },
            { nome: 'Carta di Giove', descrizione: 'Carta associata a Giove.', tipo: 'Giove', ottava_id: ottavaGiove.id },
        ],
    });

    // Inserimento delle carte del mazzo francese
    const semi = ['Cuori', 'Quadri', 'Fiori', 'Picche'];
    const valori = ['Asso', 'Due', 'Tre', 'Quattro', 'Cinque', 'Sei', 'Sette', 'Otto', 'Nove', 'Dieci', 'Jack', 'Regina', 'Re'];

    for (const seme of semi) {
        for (const valore of valori) {
            await prisma.carte.create({
                data: {
                    nome: `${valore} di ${seme}`,
                    descrizione: `Carta del ${valore} di ${seme}`,
                    tipo: 'Francese',
                },
            });
        }
    }

    // Inserimento di relazioni tra ottave
    await prisma.relazioni_Ottave.createMany({
        data: [
            { ottava_superiore_id: ottavaSole.id, ottava_inferiore_id: ottavaGiove.id, tipo_relazione: 'Complementare' },
            { ottava_superiore_id: ottavaGiove.id, ottava_inferiore_id: ottavaMarte.id, tipo_relazione: 'Complementare' },
            { ottava_superiore_id: ottavaMarte.id, ottava_inferiore_id: ottavaTerra.id, tipo_relazione: 'Complementare' },
            { ottava_superiore_id: ottavaTerra.id, ottava_inferiore_id: ottavaVenere.id, tipo_relazione: 'Complementare' },
            { ottava_superiore_id: ottavaVenere.id, ottava_inferiore_id: ottavaMercurio.id, tipo_relazione: 'Complementare' },
            { ottava_superiore_id: ottavaMercurio.id, ottava_inferiore_id: ottavaLuna.id, tipo_relazione: 'Complementare' },
        ],
    });

    console.log('Database seeded successfully.');
}

main()
    .then(async () => {
        await prisma.$disconnect();
    })
    .catch(async (e) => {
        console.error(e);
        await prisma.$disconnect();
        process.exit(1);
    });

