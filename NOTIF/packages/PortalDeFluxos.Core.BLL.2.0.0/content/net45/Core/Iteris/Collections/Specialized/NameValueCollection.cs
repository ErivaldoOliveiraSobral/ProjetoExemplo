﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Runtime.Serialization;
using System.Security.Permissions;
using Iteris.Collections.Generic;

namespace Iteris.Collections.Specialized {

	/// <summary>
	/// Represents a collection of associated System.String keys and System.String values
	/// that can be accessed either with the key or with the index.
	/// </summary>
	[Serializable]
	public class NameStringCollection : NameObjectCollectionBase, ISerializable, ICollection<WritableKeyValuePair<String, String>> {

		// Creates an empty collection.
		public NameStringCollection() {
		}

		// Adds elements from an IDictionary into the new collection.
		public NameStringCollection(IDictionary dictionary) {
			if (dictionary == null)
				throw new ArgumentNullException("dictionary");

			foreach (DictionaryEntry entry in dictionary)
				BaseAdd((String)entry.Key, entry.Value);
		}

		// Adds elements from an IDictionary into the new collection.
		public NameStringCollection(IDictionary dictionary, Boolean readOnly)
			: this(dictionary) {
			IsReadOnly = readOnly;
		}

		// Gets a key-and-value pair (DictionaryEntry) using an index.
		public WritableKeyValuePair<String, String> this[Int32 index] {
			get {
				return new WritableKeyValuePair<String, String>(BaseGetKey(index), (String)BaseGet(index));
			}
		}

		// Gets or sets the value associated with the specified key.
		public String this[String key] {
			get {
				return ((String)BaseGet(key));
			}
			set {
				BaseSet(key, value);
			}
		}

		// Gets a String array that contains all the keys in the collection.
		public ICollection<String> AllKeys {
			get { return BaseGetAllKeys(); }
		}

		// Gets an Object array that contains all the values in the collection.
		public Array AllValues {
			get { return BaseGetAllValues(); }
		}

		// Gets a String array that contains all the values in the collection.
		public ICollection<String> AllStringValues {
			get { return ((String[])BaseGetAllValues(Type.GetType("System.String"))); }
		}

		// Gets a value indicating if the collection contains keys that are not null.
		public Boolean HasKeys {
			get {
				return (BaseHasKeys());
			}
		}

		// Adds an entry to the collection.
		public void Add(String key, String value) {
			BaseAdd(key, value);
		}

		public void Add(WritableKeyValuePair<String, String> item) {
			BaseAdd(item.Key, item.Value);
		}

		// Adds a range of entries to the collection.
		public void AddRange(NameStringCollection value) {
			if (value == null)
				return;

			foreach (WritableKeyValuePair<String, String> entry in value)
				BaseAdd(entry.Key, entry.Value);
		}

		// Removes an entry with the specified key from the collection.
		public void Remove(String key) {
			BaseRemove(key);
		}

		// Removes an entry in the specified index from the collection.
		public void Remove(Int32 index) {
			BaseRemoveAt(index);
		}

		// Clears all the elements in the collection.
		public void Clear() {
			BaseClear();
		}

		public void CopyTo(NameStringCollection array, Int32 index) {
			if (array == null)
				throw new ArgumentNullException("array");

			for (Int32 i = index; i < array.Count && i < Count; ++i)
				array.Add(this[i]);
		}

		protected NameStringCollection(SerializationInfo info, StreamingContext context) :
			base(info, context) {
			if (info == null)
				throw new ArgumentNullException("info");

			AddRange((NameStringCollection)info.GetValue("Value", this.GetType()));
		}

		[SecurityPermission(SecurityAction.LinkDemand, Flags = SecurityPermissionFlag.SerializationFormatter)]
		public override void GetObjectData(SerializationInfo info, StreamingContext context) {
			if (info == null)
				throw new ArgumentNullException("info");

			base.GetObjectData(info, context);
			info.AddValue("Value", this, this.GetType());
		}

		public Boolean Contains(WritableKeyValuePair<String, String> item) {
			return this.Any(keyValuePair => keyValuePair.Key == item.Key);
		}

		public void CopyTo(WritableKeyValuePair<String, String>[] array, Int32 arrayIndex) {
			if (array == null)
				throw new ArgumentNullException("array");

			for (Int32 i = 0; i < array.Length && (i + arrayIndex) < Count; ++i)
				array[i] = this[i + arrayIndex];
		}

		public new Boolean IsReadOnly {
			get { return base.IsReadOnly; }
			set { base.IsReadOnly = value; }
		}

		public Boolean Remove(WritableKeyValuePair<String, String> item) {
			Boolean contains = this.Contains(item);
			this.Remove(item.Key);
			return contains;
		}

		public new IEnumerator<WritableKeyValuePair<String, String>> GetEnumerator() {
			return new NameStringCollection.Enumerator(this);
		}

		[Serializable]
		public struct Enumerator : IEnumerator<WritableKeyValuePair<String, String>>, IDisposable, IEnumerator {
			private Int32 _index;
			private NameStringCollection _collection;

			public Enumerator(NameStringCollection collection) {
				_index = -1;
				_collection = collection;
			}

			public WritableKeyValuePair<String, String> Current {
				get { return _collection[_index]; }
			}

			public bool MoveNext() {
				if (++_index < _collection.Count)
					return true;
				--_index;
				return false;
			}

			public void Reset() {
				_index = 0;
			}

			object IEnumerator.Current {
				get {
					return _collection[_index];
				}
			}

			public void Dispose() {
			}

		}

	}

}
