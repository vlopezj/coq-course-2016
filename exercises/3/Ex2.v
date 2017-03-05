(** Inductive datatypes were not part of the original calculus of
    constructions. The only native logical connective is product
    (forall) but it can be used to define other connectives.*)

(** The first two definitions are fairly useless but illustrate the
    logical interpretation of the product construct. *)
Definition implies (P Q : Prop) := P -> Q.

Definition univ_quantification (T : Type) (P : T -> Prop) := forall (x : T), P x.

(** Conjunction *)
Definition and (P Q : Prop) := forall (R : Prop), (P -> Q -> R) -> R.
(** This can be understood as "any proposition R that requires a
    function of type P -> Q -> R to be is the type of proofs of P and
    Q".*)

(** Disjunction *)
Definition or (P Q : Prop) := forall (R : Prop), (P -> R) -> (Q -> R) -> R.

(** Negation *)
Definition not (P : Prop) := forall (Q : Prop), P -> Q.
  
(** Existential quantification*)
Definition ex (T : Type) (P : T -> Prop) := forall (Q : Prop), (forall (t : T), P t -> Q) -> Q.

(** Prove the following lemmas, first with a proof script, then by
    writing a proof term directly.*)

(** To make it easier to write proof terms, you can write terms with
    placeholders (underscore) such as (fun (x : T) => _). If the
    content of the placeholder can be inferred because of type
    dependencies, Coq will do so automatically. Otherwise you get an
    error message with indicates the expected type of the
    placeholder.*)

(** Example*)
Theorem or_comm : forall (P Q : Prop), or P Q -> or Q P.
Proof.
  unfold or; intros.
  apply H.
  - exact H1.
  - exact H0.
Qed.

Definition or_comm' : forall (P Q : Prop), or P Q -> or Q P :=
  fun (P Q : Prop) (H : or P Q) (R : Prop) (H0 : Q -> R) (H1 : P -> R) => H R H1 H0.

Theorem and_comm : forall (P Q : Prop), and P Q -> and Q P.
  (* write a proof script here *)
Admitted.

Definition and_comm' : forall (P Q : Prop), and P Q -> and Q P
  (* write a proof term here *)
. Admitted.

Theorem and_proj_l : forall (P Q : Prop), and P Q -> P.
  (* write a proof script here *)
Admitted.

Definition and_proj_l' : forall (P Q : Prop), and P Q -> P
  (* write a proof term here *)
. Admitted.

Theorem absurd : forall (P Q : Prop), P -> not P -> Q.
  (* write a proof script here *)
Admitted.

Definition absurd' : forall (P Q : Prop), P -> not P -> Q
  (* write a proof term here *)
. Admitted.

Theorem modus_ponens : forall (P Q : Prop), and (or (not P) Q) P -> Q.
  (* write a proof script here *)
Admitted.

Definition modus_ponens' : forall (P Q : Prop), and (or (not P) Q) P -> Q
  (* write a proof term here *)
. Admitted.

(** Provide a non-inductive definition of the type of equivalent
    propositions, without relying on a previously defined proposition
    (such as and)*)
Definition iff (P Q : Prop) : Prop := True.

Theorem iff_refl : forall (A : Prop), iff A A.
  (* write a proof script here *)
Admitted.

Definition iff_refl' : forall (A : Prop), iff A A
  (* write a proof term here *)
. Admitted.

Theorem iff_sym : forall (A B: Prop), (iff A B) -> (iff B A).
  (* write a proof script here *)
Admitted.

Definition iff_sym' : forall (A B: Prop), (iff A B) -> (iff B A)
  (* write a proof term here *)
. Admitted.

Theorem iff_trans : forall A B C:Prop, (iff A B) -> (iff B C) -> (iff A C).
  (* write a proof script here *)
Admitted.

Definition iff_trans' : forall (A B C : Prop), (iff A B) -> (iff B C) -> (iff A C)
  (* write a proof term here *)
. Admitted.

Theorem all_not_ex :
  forall (T : Type) (P : T -> Prop),
    iff (forall (x : T), not (P x)) (not (ex T P)).
Proof.
  (* write a proof script here *)
Admitted.

Definition ex_not_all :
  forall (T : Type) (P : T -> Prop),
    iff (forall (x : T), not (P x)) (not (ex T P))
  (* write a proof term here *)
. Admitted.

(** Try to give a non-inductive definition of the type of false
    propositions *)
Definition false : Prop := True.

(** Hint for the definition: the principle of explosion (forall P,
    false -> P) can be seen as defining falsehood. *)
Theorem ex_falso : forall (P : Prop), false -> P.
  (* write a proof script here *)
Admitted.

Definition ex_falso' : forall (P : Prop), false -> P
  (* write a proof term here *)
. Admitted.

Theorem not_alternative_def : forall (P : Prop), iff (P -> false) (not P).
  (* write a proof script here *)
Admitted.

Definition not_alternative_def' : forall (P : Prop), iff (P -> false) (not P)
  (* write a proof term here *)
. Admitted.