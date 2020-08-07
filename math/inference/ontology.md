+++
title = "Ontology"
+++

## Theme
Ontology is concerned with entities: their classification and relationship. Every entity has certain properties.

### Motivation
The main benefit of ontology is that one can reason about an entity using general statements about the corresponding entity type.

Ontologies are very useful, for example, in the case of understanding speech - where many different words (eg: man, indian .. ) are used to hint at the same entity.

## Entity-types
Entities having several properties in common can be viewed as being instances of a single entity-type. Various entity-types may be related by specialization (is-a) and composition (has-a) relationships.

The collection of entity-types and their relationships is called an ontology.

### Graph notation
This relationship among entity-types may be represented using a directed graph. Entity-types are represented by nodes. A Is-a B and A has-a B relationships are denoted by arrows directed from B to A. Nodes involved in composition are distinguished - example by a thick/ double-line boundary.

### Taxonomy
Aka specialization trees. Entity-types are often composed to form a hierarchical specialization-tree - as in the case of biology interested in studying the descent of species.

### Examples
Object oriented programming, where classes are related by specialization and composition relationships, focuses strongly on ontology.

## Instantiation of ontology
Every object or concept can be viewed as an instantiation not just of a particular entity-type, but of the ontology, with its various specializations and compositions.

### Motivation
This enables us to list various properties and identities associated with that object. This enables reasoning about it.

