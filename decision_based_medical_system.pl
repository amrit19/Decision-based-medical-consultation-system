%user_shell
    amr :-
        writeln('           A Decision based medical consultation system by amrit puhan             '),
        writeln('                 ROLL NO 116CS0216                          '),
        writeln('patients name:'),
        readln(Patient),
        writeln('age:'),
        readln(Age),
        writeln('gender:'),
        readln(Gender),
        writeln('hello'),
        write(Patient),write('||'),write(Gender),write('||'),write(Age),nl,
        hypothesis(Patient,Disease),
        write(Patient),write('probably has 0.7 Certainty Factor chance of'),write(Disease),nl,
        writeln('Medical Treatment: Patients are adviced to take'),
        write('metronidazole, a penicillin (ie, ticarcillin, ampicillin, piperacillin) and a beta-lactamase inhibitor (ie, clavulanic acid, sulbactam, tazobactam), tigecycline (approved only for intra-abdominal and skin and soft tissue infections), and the carbapenems (eg, imipenem, meropenem, doripenem, ertapenem) DEPENDING ON YOUR FURTHER SYMPTOMPS.'),nl,
        writeln('We are happy to help,Thank You').

    amr :-
        write('the bacteroids have a 0.3 certainty factor of '),nl,
        write('not entering the patient'),nl,
        writeln('Visit Again ! We are happy to help').

    %inference_engine
    symptom(Patient,primary_inf) :-
        write("Does "),write(Patient),write(" have a primary infection (yes/no) ?"),nl,
        response(Reply),
        Reply='yes'.

    symptom(Patient,bacterial_inf) :-
        write("Does "),write(Patient),write(" have a bacterial infection (yes/no) ?"),nl,
        response(Reply),
        Reply='yes'.

    symptom(Patient,culture_site) :-
        write("Does "),write(Patient),write(" having the infection, the site of culture is one of the sterilesites (yes/no) ?"),nl,
        response(Reply),
        Reply='yes'.

    symptom(Patient,entry_portal):-
        write("Does "),write(Patient),write(" having the infection, have the suspected portal of entry of the organism as gastrointestinal tract (yes/no) ?"),nl,
        response(Reply),
        Reply='yes'.


    %knowledge_base
    hypothesis(Patient,bacteroides) :-
        symptom(Patient,primary_inf),
        symptom(Patient,bacterial_inf),
        symptom(Patient,culture_site),
        symptom(Patient,entry_portal).



    response(Reply) :-
        read(Reply),
        writeln(Reply).
