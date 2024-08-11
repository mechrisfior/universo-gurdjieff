import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
    // Inserimento delle forze cosmiche
    const forzaAttiva = await prisma.forze.create({
        data: {
            nome: 'Forza Attiva',
            descrizione: 'Questa è la forza attiva che guida l’evoluzione.',
            tipo: 'Attiva',
        },
    });

    const forzaPassiva = await prisma.forze.create({
        data: {
            nome: 'Forza Passiva',
            descrizione: 'Questa è la forza passiva che resiste ai cambiamenti.',
            tipo: 'Passiva',
        },
    });

    const forzaNeutra = await prisma.forze.create({
        data: {
            nome: 'Forza Neutra',
            descrizione: 'Questa è la forza neutra che bilancia attiva e passiva.',
            tipo: 'Neutra',
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

    const ottavaLuna = await prisma.ottave.create({
        data: {
            nome: 'Ottava della Luna',
            frequenza_iniziale: 216.0,
            frequenza_finale: 432.0,
            forza_id: forzaPassiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione lunare.',
            livello: 2,
        },
    });

    const ottavaTerra = await prisma.ottave.create({
        data: {
            nome: 'Ottava della Terra',
            frequenza_iniziale: 108.0,
            frequenza_finale: 216.0,
            forza_id: forzaNeutra.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione della Terra.',
            livello: 3,
        },
    });

    const ottavaMarte = await prisma.ottave.create({
        data: {
            nome: 'Ottava di Marte',
            frequenza_iniziale: 54.0,
            frequenza_finale: 108.0,
            forza_id: forzaAttiva.id,
            descrizione: 'Questa ottava rappresenta l’evoluzione marziana.',
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

    // Inserimento di vibrazioni associate alle ottave
    await prisma.vibration.createMany({
        data: [
            { frequenza: 432.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaSole.id },
            { frequenza: 648.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaSole.id },
            { frequenza: 864.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaSole.id },
            { frequenza: 216.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaLuna.id },
            { frequenza: 324.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaLuna.id },
            { frequenza: 432.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaLuna.id },
            { frequenza: 108.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaTerra.id },
            { frequenza: 162.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaTerra.id },
            { frequenza: 216.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaTerra.id },
            { frequenza: 54.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaMarte.id },
            { frequenza: 81.0, intensita: 0.8, fase: 'medio', ottava_id: ottavaMarte.id },
            { frequenza: 108.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaMarte.id },
            { frequenza: 27.0, intensita: 1.0, fase: 'iniziale', ottava_id: ottavaVenere.id },
            { frequenza: 40.5, intensita: 0.8, fase: 'medio', ottava_id: ottavaVenere.id },
            { frequenza: 54.0, intensita: 0.6, fase: 'finale', ottava_id: ottavaVenere.id },
        ],
    });

    // Inserimento di relazioni tra ottave
    await prisma.relazioni_Ottave.create({
        data: {
            ottava_superiore_id: ottavaSole.id,
            ottava_inferiore_id: ottavaLuna.id,
            tipo_relazione: 'Complementare',
        },
    });

    await prisma.relazioni_Ottave.create({
        data: {
            ottava_superiore_id: ottavaLuna.id,
            ottava_inferiore_id: ottavaTerra.id,
            tipo_relazione: 'Complementare',
        },
    });

    await prisma.relazioni_Ottave.create({
        data: {
            ottava_superiore_id: ottavaTerra.id,
            ottava_inferiore_id: ottavaMarte.id,
            tipo_relazione: 'Complementare',
        },
    });

    await prisma.relazioni_Ottave.create({
        data: {
            ottava_superiore_id: ottavaMarte.id,
            ottava_inferiore_id: ottavaVenere.id,
            tipo_relazione: 'Complementare',
        },
    });

    // Inserimento di segmenti
    await prisma.segmenti.createMany({
        data: [
            { nome: 'Assoluto', descrizione: 'Il livello più alto di esistenza.', ordine: 1 },
            { nome: 'Galassia', descrizione: 'Una galassia in cui si trovano più sistemi stellari.', ordine: 2 },
            { nome: 'Sistema Solare', descrizione: 'Il sistema solare della Terra.', ordine: 3 },
            { nome: 'Pianeta Terra', descrizione: 'Il pianeta abitato dagli esseri umani.', ordine: 4 },
            { nome: 'Regno Minerale', descrizione: 'La parte del mondo occupata dai minerali.', ordine: 5 },
        ],
    });

    // Inserimento di leggi cosmiche
    await prisma.leggi_Cosmiche.createMany({
        data: [
            { nome: 'Legge del Tre', descrizione: 'La legge che governa le triadi.', categoria: 'Legge Universale' },
            { nome: 'Legge del Sette', descrizione: 'La legge che governa l’armonia e le ottave.', categoria: 'Legge Universale' },
        ],
    });

    // Inserimento di eventi cosmici
    await prisma.eventi_Cosmici.create({
        data: {
            nome: 'Grande Allineamento',
            descrizione: 'Un raro evento cosmico in cui tutti i pianeti del sistema solare si allineano.',
            data_inizio: new Date('2024-12-21'),
            data_fine: new Date('2024-12-22'),
        },
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